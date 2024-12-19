require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.19-3-darwin-x64.tar.gz"
    sha256 "3fe25cbe13918cb6ceaf543be233d77da37dc02f70aef067ab8b7658c114b9d9"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.19-3-darwin-arm64.tar.gz"
      sha256 "b42387788bcff0604e6dafa70fe701f6f90b5df4cd78e1cf872f1a1a8076cdde"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.19-3-linux-x64.tar.gz"
    sha256 "0d065916c808aab9ecc5e190570204c3fc0329e1c75e5b4c71629b788096350e"
  end
  version "2024.12.19-3"
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
