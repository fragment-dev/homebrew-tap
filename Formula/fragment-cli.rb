require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.18-1-darwin-x64.tar.gz"
    sha256 "83e358d61b41b631da5cc3647185575c65c925668b235062fa78d00f2b7c1277"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.18-1-darwin-arm64.tar.gz"
      sha256 "916bcbd266f5f182c051723535962395f9d8a7be8c07352bb424d34377a649e7"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.1.18-1-linux-x64.tar.gz"
    sha256 "0bc6f88eac0f1095f927758fc026194e57005df7856d96614ce8c33d546c0f0e"
  end
  version "2024.1.18-1"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
