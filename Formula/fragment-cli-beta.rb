require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3050.0.0-darwin-x64.tar.gz"
    sha256 "e0816dd3449ed43028a9860aed07f8cc295efe777c23aaa04b08b5cf6e6d2dd5"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3050.0.0-darwin-arm64.tar.gz"
      sha256 "5ad6e7143b800c0c1bb37a6cc4cab484b254cfff940f1bebfec4b0d1bc3e5dc6"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3050.0.0-linux-x64.tar.gz"
    sha256 "9c2268fe185109239ad35f43b937975a8fc685566d0624021ce43ed927d1f038"
  end
  version "3050.0.0"
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
