require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6049.0.0-darwin-x64.tar.gz"
    sha256 "5fa5412ed13bb39210823e82beae8b1b1178f17173b14f71a37bfabca53c7c55"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6049.0.0-darwin-arm64.tar.gz"
      sha256 "b0b7bf2b5c3fd28491128a9ee017cd7ce4a30f582b3ae3de5f17b6e06649991d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6049.0.0-linux-x64.tar.gz"
    sha256 "7b270360544903a9cbc344b0920e221521e2e24683be59a359da3bb48c8421bb"
  end
  version "6049.0.0"
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
