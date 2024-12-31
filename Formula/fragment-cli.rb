require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.31-darwin-x64.tar.gz"
    sha256 "f403a1209777ad1dc1d79af80ca03f7bf030146ad90e20f113432222dd37fa63"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.31-darwin-arm64.tar.gz"
      sha256 "53a9f94d4f82ca918050fcf2b22e15e8fcc09d692a1f24bcdd9029371bce3f41"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.31-linux-x64.tar.gz"
    sha256 "cd2095684f09717be704cccacc2b595f1b93b3c123a7bba07978966faa036187"
  end
  version "2024.12.31"
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
