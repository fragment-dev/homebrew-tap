require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4377.0.0-darwin-x64.tar.gz"
    sha256 "9ef6dddf7308dafbd93fd827438312221ca438591fb0ed7c8578a394eb1a6699"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4377.0.0-darwin-arm64.tar.gz"
      sha256 "1fed4662d7f4a02973414952119fc1e771f975ca700a0f6207fd3c30f9005d91"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4377.0.0-linux-x64.tar.gz"
    sha256 "798e4a6deb4c2bb263942880da1a8844c12369bbd1ee6830a2b8ef2338ab05f8"
  end
  version "4377.0.0"
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
