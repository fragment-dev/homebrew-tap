require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4810.0.0-darwin-x64.tar.gz"
    sha256 "dcb7e02932bd1fb6e96968d1ac92df1c7d988f57dd793aa659c112ba43686aa1"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4810.0.0-darwin-arm64.tar.gz"
      sha256 "c29ac0c585e586329229aa4673797870a6ba067a4bc5cccb929897cef639b597"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4810.0.0-linux-x64.tar.gz"
    sha256 "0e8e5fe0e90b9fc273226ba323c7758e87b4e82ece5ae60da752a7fa7c17150f"
  end
  version "4810.0.0"
  license "MIT"
  depends_on "node@20"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
