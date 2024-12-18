require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.17-1-darwin-x64.tar.gz"
    sha256 "4ad7caef3b9fb4c2249b673db4862a890e77841f6653063de37dcff4cd1c821b"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.17-1-darwin-arm64.tar.gz"
      sha256 "4afe39c66b5f293af181a9de981a31a131a392a9b3727226d788c64dac5e26a7"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.17-1-linux-x64.tar.gz"
    sha256 "aa8ae529ec4ca3f81fc0bc76afdf2f884739c647a8f128e7a155ceb7ddba4632"
  end
  version "2024.12.17-1"
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
