require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2507.0.0-darwin-x64.tar.gz"
    sha256 "0c5dfab9df969bbd3c1e72eaebbfc656bf636636d0e05c048c945bd9e7f26ce4"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2507.0.0-darwin-arm64.tar.gz"
      sha256 "e0d440bef6a4d411493de24c8d01e283417752f4fded57a24287dbfd02897eaf"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2507.0.0-linux-x64.tar.gz"
    sha256 "598fe3542ea601ad9d05ea1d00ce45b6bc687c3def2b9d2aa90d853c81bf2849"
  end
  version "2507.0.0"
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
