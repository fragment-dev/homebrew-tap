require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.12-darwin-x64.tar.gz"
    sha256 "1c6be83a8ab278e3e8e1616110160a6520db9221de95474bc0162c9448991b32"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.12-darwin-arm64.tar.gz"
      sha256 "48ea92d4a0b431522f286568b6eff4bc18a3af30dcb1a6d0b7cc0ea59b34e9d4"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.5.12-linux-x64.tar.gz"
    sha256 "eccbc5016f2b619a53b2507f90be7b5b96f770a56b9a072a2ae6d055241cc550"
  end
  version "2024.5.12"
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
