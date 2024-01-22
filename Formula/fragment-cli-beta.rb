require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4385.0.0-darwin-x64.tar.gz"
    sha256 "7164ff457917688e38c57743dab3d254242383d051556f6a5c711197f25317b5"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4385.0.0-darwin-arm64.tar.gz"
      sha256 "8e8252b968a547ae2569ccfec469ca85ae13c8d9f4972a9fe7d7877f547a348e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4385.0.0-linux-x64.tar.gz"
    sha256 "b4e907d0201dd4050df7d099b2b18845971c6934ddd8f96055e374768b5d2a97"
  end
  version "4385.0.0"
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
