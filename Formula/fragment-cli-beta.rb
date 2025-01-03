require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6032.0.0-darwin-x64.tar.gz"
    sha256 "2f4eb416820470416718611eac5a4444d18f032a7d409d7e6c11d08bd5dd9db9"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6032.0.0-darwin-arm64.tar.gz"
      sha256 "3fab99379a80fd2f1cddb076d10db1471a924f0c0d172f19609d2ccfc3382b19"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6032.0.0-linux-x64.tar.gz"
    sha256 "ac280a58ddadd00dc91da15a6abdbae5edbf4efbe2f2670e56371ed0ff3019d4"
  end
  version "6032.0.0"
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
