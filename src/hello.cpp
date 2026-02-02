#include <iostream>
#include <occi.h>

using namespace oracle::occi;
using namespace std;

int main() {
    string user = "oralib";
    string passwd = "password";
    string db = "oracle:1521/xepdb1";

    try {
        // Create Environment and Connection
        Environment *env = Environment::createEnvironment(Environment::DEFAULT);
        Connection *conn = env->createConnection(user, passwd, db);
        cout << "Successfully connected to Oracle Database!" << endl;

        // Create Statement and Query
        Statement *stmt = conn->createStatement("SELECT 'Hello World' FROM DUAL");
        ResultSet *rs = stmt->executeQuery();

        // Fetch Result
        if (rs->next()) {
            cout << rs->getString(1) << endl;
        }

        // Cleanup
        stmt->terminateResultSet(rs);
        conn->terminateStatement(stmt);
        env->terminateConnection(conn);
        Environment::terminateEnvironment(env);

    } catch (SQLException &ea) {
        cerr << "Error: " << ea.getMessage() << endl;
        return 1;
    }
    return 0;
}