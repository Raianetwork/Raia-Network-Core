// Copyright (c) 2011-2014 The Bitcoin Core developers
// Copyright (c) 2017-2019 The Raven Core developers
// Copyright (c) 2020-2021 The RAIA Network developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef RAIANETWORK_QT_RAIANETWORKADDRESSVALIDATOR_H
#define RAIANETWORK_QT_RAIANETWORKADDRESSVALIDATOR_H

#include <QValidator>

/** Base58 entry widget validator, checks for valid characters and
 * removes some whitespace.
 */
class RaianetworkAddressEntryValidator : public QValidator
{
    Q_OBJECT

public:
    explicit RaianetworkAddressEntryValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

/** raianetwork address widget validator, checks for a valid raianetwork address.
 */
class RaianetworkAddressCheckValidator : public QValidator
{
    Q_OBJECT

public:
    explicit RaianetworkAddressCheckValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

#endif // RAIANETWORK_QT_RAIANETWORKADDRESSVALIDATOR_H
