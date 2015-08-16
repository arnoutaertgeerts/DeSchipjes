__author__ = 'u0098668'

import pickle
import os
import DyMat

import pandas as pd


def save(src, dest, overwrite=False):
    """
    Convert a result file into a pickeled pandas dataframe object
    :param src: The location of the result file
    :param dest: The location of the saved pickeled file
    :param overwrite: If true, overwrite the previous file if it exists
    """

    if os.path.isfile(dest) and not overwrite:
        print 'File already existed and was NOT overwritten'

    else:
        res = DyMat.DyMatFile(src)
        df = to_pandas(res)
        df.to_hdf(dest, 'data')


def load(src):
    """
    Load a previously pickeled file into memory
    :param src: The location of the saved pickled file
    """
    return pd.read_hdf(src, 'data')


def to_pandas(dymat):
    """
    Convert a dymat object to a pandas dataframe
    :param dymat: The dymat object
    """
    blocks = dymat.blocks()
    dfs = []

    for b in blocks:
        d = dymat.getVarArray(dymat.names(b), False)
        n = dymat.names(b)
        a = dymat.abscissa(b)[0]
        dfs.append(pd.DataFrame(data=d.T, columns=n).set_index(
            pd.to_datetime(a, unit='s')))

    df = pd.concat(dfs)

    df["index"] = df.index
    df.drop_duplicates(subset='index', inplace=True)
    del df["index"]

    df = df.sort_index()
    df = df.fillna(method='ffill').fillna(method='bfill')

    return df
