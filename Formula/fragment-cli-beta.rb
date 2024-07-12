require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5387.0.0-darwin-x64.tar.gz"
    sha256 "bc053280635cfd4e47773d35bd79a3c818c4b93fb17a417883b5e4f9aa4e239f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5387.0.0-darwin-arm64.tar.gz"
      sha256 "cb4478359f6e9308e35b46a5945822b190d664a4015dbc9ec56f833be6413d70"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5387.0.0-linux-x64.tar.gz"
    sha256 "e6fb4d446be3686ee74bcce0e0d6beaaa6f28c6d0042712bd6ff71d2ea124364"
  end
  version "5387.0.0"
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
