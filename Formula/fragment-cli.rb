require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.12.26-darwin-x64.tar.gz"
    sha256 "90d32674984dc811432150e687ecedfe71afffa86ba30de091ac064be0be65c9"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.12.26-darwin-arm64.tar.gz"
      sha256 "36c99e1c9c56ea3ad530ec26228349b661dd85fa2b359ceb6dafede32bc078ab"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.12.26-linux-x64.tar.gz"
    sha256 "ba7025b5b9010c157a3f3e302c393baea00a0d6697881731ee5b93f081c4aa75"
  end
  version "2023.12.26"
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
