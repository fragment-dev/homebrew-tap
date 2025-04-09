require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6496.0.0-darwin-x64.tar.gz"
    sha256 "95f40cce21d9776baff5ef4239ca3f8d8ea15f6c3770e002a6dca9e27268a6f3"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6496.0.0-darwin-arm64.tar.gz"
      sha256 "9f98ea53df9c951305de1a20bd182fbf7a5411a28a16ab1da980e8aedf02e69c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6496.0.0-linux-x64.tar.gz"
    sha256 "31ab200ba82853429dc3d4f6e09fc42e8066a0e9c9d3d82b9951e804225427be"
  end
  version "6496.0.0"
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
