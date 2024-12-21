require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5957.0.0-darwin-x64.tar.gz"
    sha256 "6f349ef9b5cbaefa9109ca309a4f10e9ca1386eae3b7ac3748db50e71d9176b3"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5957.0.0-darwin-arm64.tar.gz"
      sha256 "4d431ea18edadcaa6fdb4d253f3396ad36b08e6b2bd49b19123b4fd7d98a6c27"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5957.0.0-linux-x64.tar.gz"
    sha256 "82a8e0b3c68087ad1bdfd828fc7fb771f67b154834a69e71dd69e1b564c1bd12"
  end
  version "5957.0.0"
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
