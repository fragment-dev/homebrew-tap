require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3820.0.0-darwin-x64.tar.gz"
    sha256 "57577bee8a66c9ab6beb524cb97bd2df7b8d894a0d87950ac85aa3e44a0b1474"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3820.0.0-darwin-arm64.tar.gz"
      sha256 "e2c6d970099d4dffa04dcc7d78c47e67acdf0d2db275426e9feadc338a0b6167"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3820.0.0-linux-x64.tar.gz"
    sha256 "c2bfbf8d1d5611d43024b97e6c6940c57a02aa5740c18729b312bca20c5ceddc"
  end
  version "3820.0.0"
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
