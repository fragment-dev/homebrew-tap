require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4916.0.0-darwin-x64.tar.gz"
    sha256 "e1180bc64a9b9a46d08dd9f63f3671455b65d2d257227f7c8ec9aaac59fcbcf8"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4916.0.0-darwin-arm64.tar.gz"
      sha256 "dfca8ea14c8e8ffa2c5c0cd1001d24741b4305af9c4dee659389525af7064642"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4916.0.0-linux-x64.tar.gz"
    sha256 "0f2bf3abd7738916d557afdb6d5168b2d7dc4f1abeefab04894300d0c3251ef4"
  end
  version "4916.0.0"
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
