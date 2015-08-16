__author__ = 'u0098668'

import data
import DyMat
import pandas as pd
import fnmatch
import os


class Result():

    def __init__(self, path, name=None):
        if name is None:
            name = os.path.splitext(os.path.basename(path))[0]

        self.name = name
        self.mat = DyMat.DyMatFile(path)
        self.keys = self.mat.names()

        print 'Loaded', self.name

    def get(self, keys):

        all_keys = []

        if isinstance(keys, str):
            all_keys = self.find(keys)
        else:
            for k in keys:
                all_keys += self.find(k)

        blocks = self.mat.sortByBlocks(all_keys)
        dfs = []

        for b, n in blocks.iteritems():
            d = self.mat.getVarArray(n, False)
            a = self.mat.abscissa(b)[0]
            dfs.append(pd.DataFrame(data=d.T, columns=n).set_index(
                pd.to_datetime(a, unit='s')))

        df = pd.concat(dfs)

        df["index"] = df.index
        df.drop_duplicates(subset='index', inplace=True)
        del df["index"]

        df = df.sort_index()
        df = df.fillna(method='ffill').fillna(method='bfill')

        return df

    def find(self, search):
        case = fnmatch.filter(self.keys, search)
        return filter(lambda x: fnmatch.fnmatchcase(x, search), case)

    def save(self, keys, name=None, key='data'):
        if name is None:
            name = self.name

        df = self.get(keys)
        df.to_hdf(name, key)
        print 'Saved the df in file', name, 'with key', key


class Results():

    def __init__(self, results):
        self.results = results

    def get(self, keys):
        dfs = []
        for r in self.results:

            if isinstance(keys, str):
                rkeys = r.find(keys)
            else:
                rkeys = keys

            blocks = r.mat.sortByBlocks(rkeys)
            print blocks

            for b, n in blocks.iteritems():
                d = r.mat.getVarArray(n, False)
                a = r.mat.abscissa(b)[0]
                n = map(lambda x: r.name + ' / ' + x, n)
                dfs.append(pd.DataFrame(data=d.T, columns=n).set_index(
                    pd.to_datetime(a, unit='s')))

        df = pd.concat(dfs)

        df["index"] = df.index
        df.drop_duplicates(subset='index', inplace=True)
        del df["index"]

        df = df.sort_index()
        df = df.fillna(method='ffill').fillna(method='bfill')

        return df

    def save(self, keys, name='results.df'):
        df = self.get(keys)
        df.to_hdf(name, 'data')
        return df


def load(path, key='data'):
    return pd.read_hdf(path, key)
