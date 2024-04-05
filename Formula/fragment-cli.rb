require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.5-darwin-x64.tar.gz"
    sha256 "1cfb3d37c7a376aef130866b1940f65c25509811a036ebdb74bf51c6cfa60f4d"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.5-darwin-arm64.tar.gz"
      sha256 "7592db991693def8d86739c61ca7c34d34babf7fb99f33eae35fc9466411fed7"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.4.5-linux-x64.tar.gz"
    sha256 "40bf5847cd9c6eca13b890d76f57ac7bcba78756a7e0e535a44de97ceaf19f8b"
  end
  version "2024.4.5"
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
