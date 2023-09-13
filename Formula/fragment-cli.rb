require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.9.13-1-darwin-x64.tar.gz"
    sha256 "8ec2908e13eef78f24fa33d1cbd6815912490dfbf89768355a39fe2ad195263c"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.9.13-1-darwin-arm64.tar.gz"
      sha256 "1c8f45e9967213fd5b1b9454fc4c013659f4173e7bce692764f973f77f3e5a2f"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.9.13-1-linux-x64.tar.gz"
    sha256 "c93376aeb16bb176a814824ff0c57da14d923a79ee3a7598d6b2ce836171b9f3"
  end
  version "2023.9.13-1"
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
