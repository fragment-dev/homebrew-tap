require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3819.0.0-darwin-x64.tar.gz"
    sha256 "f0b7e901e661d27c94c3ec80d881b4033317f70c77bf0918b620ad749ba5e396"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3819.0.0-darwin-arm64.tar.gz"
      sha256 "e8bc9902ebe8b36890c9560fbdc11d7dbb824ea9ea5a87e1303e97ede92cf2f9"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3819.0.0-linux-x64.tar.gz"
    sha256 "2994aa6b2a6df33027f31822738b2e3621fbedc82dd694c6ddc7c1fd3405212b"
  end
  version "3819.0.0"
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
