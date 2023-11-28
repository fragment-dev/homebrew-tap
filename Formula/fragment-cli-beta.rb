require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4055.0.0-darwin-x64.tar.gz"
    sha256 "64b9f7536fdc72364e71341e04c93ad0d6eb4fbe6d8925b85078c2542f71a0fd"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4055.0.0-darwin-arm64.tar.gz"
      sha256 "a6b6ba6c685eb3817dd26dcfb49b7621338478ca17d32e595d2989becea9dc13"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4055.0.0-linux-x64.tar.gz"
    sha256 "141c803bc9bb7d886c710f469c865b74f82596472fbee3dfe7428edac0fa8429"
  end
  version "4055.0.0"
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
