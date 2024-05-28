require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5125.0.0-darwin-x64.tar.gz"
    sha256 "9ad779afe2738e4b0154081a6f3e772ed75bd3687b75a0169b5033c989c87066"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5125.0.0-darwin-arm64.tar.gz"
      sha256 "916208c354095bab85f806a17161d2a40b0bf69b7570da90586f7c73238f49fe"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5125.0.0-linux-x64.tar.gz"
    sha256 "ace3b3de697a6051fe380841d2fa114276d660aaa43887e2495649ea465b4bac"
  end
  version "5125.0.0"
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
