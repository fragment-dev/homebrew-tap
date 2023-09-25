require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3664.0.0-darwin-x64.tar.gz"
    sha256 "7817887656d19a58d0ab306283c3fc63742de87aea89fec332b22d21ea33ae58"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3664.0.0-darwin-arm64.tar.gz"
      sha256 "9875430ca57173277f3997cf437fce49c69b1526c4df52952af5e898bfe4596c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3664.0.0-linux-x64.tar.gz"
    sha256 "6ecea5a73da029d7399117e876a29a457c42b78612cc9f2168b7b5641962712b"
  end
  version "3664.0.0"
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
