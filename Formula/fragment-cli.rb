require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.10.7-darwin-x64.tar.gz"
    sha256 "d78c0f23a0016448b9769b53055a2a16f64d4c47c61fde8b3331c2228064fc9f"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.10.7-darwin-arm64.tar.gz"
      sha256 "f7fda952fc0eba1013c769e1fd0be9cf18797b0a574b1bdbb0ebc60f046c8742"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.10.7-linux-x64.tar.gz"
    sha256 "f5011c98899d2a647bcefc21d4efd47444bcc18e96cf40e7111c1bb62784335b"
  end
  version "2024.10.7"
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
