require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.10.11-darwin-x64.tar.gz"
    sha256 "3af57f6e6107c783ba97e70080547ea33e90b17b0324476ea736ab31d57c1bd2"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.10.11-darwin-arm64.tar.gz"
      sha256 "a2452d59432a6c6029a086cc401bac11c21156862f3d481feed501559cdced40"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.10.11-linux-x64.tar.gz"
    sha256 "5f2bf72eb804d5a7cff50c8a00c09fd192ea7af5f896fd92f5dde2160b88aa65"
  end
  version "2023.10.11"
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
