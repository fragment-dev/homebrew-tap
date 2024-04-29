require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4966.0.0-darwin-x64.tar.gz"
    sha256 "3acede4b2f769813721809c45f959ddfd17ba5b440b698b99b4222bb9a8d83b1"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4966.0.0-darwin-arm64.tar.gz"
      sha256 "26ede6f538dd1b5dd4b06dd2b46834e336c5623e54b246d2862b9f6fcc365033"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4966.0.0-linux-x64.tar.gz"
    sha256 "5b27c6712667532a7f6067d9163d67591adea3e3c240329105c8fef0f8f1038c"
  end
  version "4966.0.0"
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
