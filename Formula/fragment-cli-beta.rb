require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5067.0.0-darwin-x64.tar.gz"
    sha256 "7512a75c3ecb5d273a60f9357dd8ae3877714f9f0651e4c05913d4fb7aaf1831"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5067.0.0-darwin-arm64.tar.gz"
      sha256 "2a6609249755ef3fda2504cbf714ce623e9bb74b42c4b43885ce8eda12d6aac7"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5067.0.0-linux-x64.tar.gz"
    sha256 "9b459951c5d639f7bb70b3c7509d447ea4c0621cb04cb08b8ca5cf2d00f3db34"
  end
  version "5067.0.0"
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
