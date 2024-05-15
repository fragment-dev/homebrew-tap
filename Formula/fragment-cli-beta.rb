require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5060.0.0-darwin-x64.tar.gz"
    sha256 "bd881d4335e2975f72d079a12e37d2cc178f4d076041d282ed57c194bc6fa9db"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5060.0.0-darwin-arm64.tar.gz"
      sha256 "60a317a4d417e0089962d55e25b0c4e07f53e8248f9da6a5fff0823645e5dd94"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5060.0.0-linux-x64.tar.gz"
    sha256 "075e88d3f1fe2c7c67fe1492a3b2f18cd9adabf92ce499ca95bfbb5527a46971"
  end
  version "5060.0.0"
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
