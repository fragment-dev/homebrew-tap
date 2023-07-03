require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3000.0.0-darwin-x64.tar.gz"
    sha256 "493fa9502bf4722812c1f444a0254216ff6a3c76f788aa03d63aa48a8f523472"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3000.0.0-darwin-arm64.tar.gz"
      sha256 "7c2d8299645c547196b9a4f122af92d6f80980a327a0a454c7d2cb38f39d5399"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3000.0.0-linux-x64.tar.gz"
    sha256 "f7dc01b38f1bf4685fc7f88f0c2df339b35c47567f465f4cb89dd8468aa05623"
  end
  version "3000.0.0"
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
