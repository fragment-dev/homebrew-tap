require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.10.17-darwin-x64.tar.gz"
    sha256 "bd20f886af6b55c6ad141a049a43d26251f438fc17d14730ffcb2bc363ac8e42"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.10.17-darwin-arm64.tar.gz"
      sha256 "e86444a08c546431ba575d5900cd74931bf0f5701eed6136e99108981cd08d8c"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.10.17-linux-x64.tar.gz"
    sha256 "c24407d258d3f18f69182933966decb53295bc0c8ab4f8da5e879b9f2861fd1e"
  end
  version "2024.10.17"
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
