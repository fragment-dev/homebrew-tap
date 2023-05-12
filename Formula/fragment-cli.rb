require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.5.12-1-darwin-x64.tar.gz"
    sha256 "4ad7998fb91fe77ca79dd50461927519ad7bc0ed07a545f5770a24a269b79801"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.5.12-1-darwin-arm64.tar.gz"
      sha256 "eb6ed097d6b61588f75e55648311915f8e301b76daea896a37993574070d90e8"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.5.12-1-linux-x64.tar.gz"
    sha256 "435d0fcf6bbd4ca5ca7553c043cea26eb99d5ca999d85a65480b57910ace77de"
  end
  version "2023.5.12-1"
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
