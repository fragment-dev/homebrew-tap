require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4584.0.0-darwin-x64.tar.gz"
    sha256 "1f362649907868aad1ba6223271816856fde79bc47d88eac089299df4532c666"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4584.0.0-darwin-arm64.tar.gz"
      sha256 "6d46836b0e862aea5db4410084a3084b4aef89a37667a339b55cfa280c33377e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4584.0.0-linux-x64.tar.gz"
    sha256 "e234d34e84bbc96aba17a8631d090b1eed0a30267124859363f4d9bfa0e75bec"
  end
  version "4584.0.0"
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
