require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5459.0.0-darwin-x64.tar.gz"
    sha256 "cb30154a096318c43cbbf06e05d3f7bf7937dd9ef6c43a50041037d289d67cd3"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5459.0.0-darwin-arm64.tar.gz"
      sha256 "f20513a7375a255412e247c638e91c1ed4db9b50daf505860b7312b7c8e0f4eb"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5459.0.0-linux-x64.tar.gz"
    sha256 "52ba4b3af7641e7ae2b9116a9faf1bbd4413e039bdb471642e6ebbba55782260"
  end
  version "5459.0.0"
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
