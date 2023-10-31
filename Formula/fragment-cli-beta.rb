require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3942.0.0-darwin-x64.tar.gz"
    sha256 "bb6c293aa8dfcb58e52d9ab561bd489e89fbe09b2e8e9fb8b22a49756fb9c4eb"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3942.0.0-darwin-arm64.tar.gz"
      sha256 "2491473cf7dc994764a6642ad2f040836811a8bdde887a32ff4b5343ac488b71"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3942.0.0-linux-x64.tar.gz"
    sha256 "d1ce6260c85367b7bb3b14c5db995e113d08e472b3f95f140d554a9313a323d3"
  end
  version "3942.0.0"
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
