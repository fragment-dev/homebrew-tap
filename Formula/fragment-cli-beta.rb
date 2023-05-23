require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2727.0.0-darwin-x64.tar.gz"
    sha256 "7f4e89b496f328b9178ac8098777b7f886461929d5bd9c6e029bd7d1bb5022eb"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2727.0.0-darwin-arm64.tar.gz"
      sha256 "73a976805b8cc21ed033c82c74b2b5555c496e584a44613a70dd180c7f7fbc0a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2727.0.0-linux-x64.tar.gz"
    sha256 "7a66d3d501c2d63afcb02cdecf5e2df174a2cf6aff4465d05b306616c617cd12"
  end
  version "2727.0.0"
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
