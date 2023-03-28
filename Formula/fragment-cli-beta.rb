require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2286.0.0-darwin-x64.tar.gz"
    sha256 "9a4d3198b31ee9c675621dd24a6aa9866cfbe62aad58ae4deb7535869b4eeb16"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2286.0.0-darwin-arm64.tar.gz"
      sha256 "0a2d283c4d28abfd0132ce36e3c0d1e3e7365cbd66d7269795b544d12a554ff1"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2286.0.0-linux-x64.tar.gz"
    sha256 "8f8f18050e99e2a826e9030bca7bafdbae94401ddaddfd31f6896a15494b7a21"
  end
  version "2286.0.0"
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
