require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4127.0.0-darwin-x64.tar.gz"
    sha256 "ad195591aef6fb064f70b17ffb078e56325117dfbc32306534307b9615159eea"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4127.0.0-darwin-arm64.tar.gz"
      sha256 "81c60288ee95f47809d3225bc26141b6375b8f691f1d0cd00796cd927578dbec"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4127.0.0-linux-x64.tar.gz"
    sha256 "98587e36a58e60f1f9d7e53d9bf177a2025696ba9d1bb7d554c0902fa5274efa"
  end
  version "4127.0.0"
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
