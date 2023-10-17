require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3852.0.0-darwin-x64.tar.gz"
    sha256 "25a1d243d0678f75420d6cc7f6f08ca79859c643956fc1b17046b55bffac2b4a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3852.0.0-darwin-arm64.tar.gz"
      sha256 "01948e57117d41542fc622fba5e1d4b60b90a62bcbe61e713dedef6b3f4a04c1"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3852.0.0-linux-x64.tar.gz"
    sha256 "32f22a1ffc98fa9056852c299e58aa45b4c54cb4229f7c9c472b11af27d669e5"
  end
  version "3852.0.0"
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
