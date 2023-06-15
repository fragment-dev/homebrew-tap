require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2852.0.0-darwin-x64.tar.gz"
    sha256 "120a12281709dd794fa6abd09aac8cd54ad5aef00818454bd3d5e91f05b5de09"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2852.0.0-darwin-arm64.tar.gz"
      sha256 "03e0598cde0a5bc780a23b4004f21f3b3a8f05bd25b34e6ca3fd308713656f76"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2852.0.0-linux-x64.tar.gz"
    sha256 "e9a667026cddadc3c4bb7311dd584ed696dcbd28a15fd10230806b4241635458"
  end
  version "2852.0.0"
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
