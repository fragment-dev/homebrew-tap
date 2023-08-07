require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3253.0.0-darwin-x64.tar.gz"
    sha256 "d8ce8fdc47a7207b04ab9d427bf6bec21aa0681201d27df8cf17479d1a32d32a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3253.0.0-darwin-arm64.tar.gz"
      sha256 "64b24b1488c713ec47792c8ba6fe866d823139838590bbea24331292fa1829b4"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3253.0.0-linux-x64.tar.gz"
    sha256 "cd299915e11bf057b32ece8053cf16f1999901221bccfefc631c7ed78c71532a"
  end
  version "3253.0.0"
  license "MIT"
  depends_on "node@16"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
