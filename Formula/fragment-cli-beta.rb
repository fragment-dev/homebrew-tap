require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2549.0.0-darwin-x64.tar.gz"
    sha256 "bf64cb97c2de311de54e4de482688c7217b487ff296fb173a9684f13dc7ec9d5"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2549.0.0-darwin-arm64.tar.gz"
      sha256 "309e970e648e377ba884321a3bc377fe2b2590294ac7a347d42e8f99957013f0"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2549.0.0-linux-x64.tar.gz"
    sha256 "70f54d8928994b90f4e87fd88a52145b16d583b5858a5eb288f2ad2a8355e992"
  end
  version "2549.0.0"
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
