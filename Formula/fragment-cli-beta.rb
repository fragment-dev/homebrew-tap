require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5930.0.0-darwin-x64.tar.gz"
    sha256 "5b46df8d283194d6b492c1c05b3c5728c30f0ca40c1f08d4cc7437978e89df8e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5930.0.0-darwin-arm64.tar.gz"
      sha256 "53b75c392b79b5a8ad29eeb88006e106906806028fce681da5cf9e6c578d72aa"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5930.0.0-linux-x64.tar.gz"
    sha256 "fb17986bf2daf5fea133d2928b58188081065dfa5e54613fc62c87a335e9ccda"
  end
  version "5930.0.0"
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
