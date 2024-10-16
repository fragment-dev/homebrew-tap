require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5670.0.0-darwin-x64.tar.gz"
    sha256 "06d2d346b9ad760f22e965a90856626b676f4a42202f90a3d1f1b688faaff513"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5670.0.0-darwin-arm64.tar.gz"
      sha256 "cc27f2e50b26577238504cfb5ba99f5ba363b08854ab53684d117a5b46872af8"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5670.0.0-linux-x64.tar.gz"
    sha256 "c78ecde418b3a216e4ccd3f4abdf462e13fb231619330ded2315673f3241a1a8"
  end
  version "5670.0.0"
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
