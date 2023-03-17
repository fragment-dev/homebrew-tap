require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2231.0.0-darwin-x64.tar.gz"
    sha256 "87e123dc5b9e77cb2bd0afb88e098f739bdbe29f32b3639a53249919b4002d96"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2231.0.0-darwin-arm64.tar.gz"
      sha256 "d6be9572657237d1020efd48d8cdc65a44f0a851fe050190717a9366bb8eef1b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2231.0.0-linux-x64.tar.gz"
    sha256 "6ae7e2021b1f43208b93be225db66a9b2f5af741745a5cfc95c57b9c16eca506"
  end
  version "2231.0.0"
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
