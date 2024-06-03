require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5174.0.0-darwin-x64.tar.gz"
    sha256 "ecd731a5e8ca6a6deb7aaf55066004d12a931101b1741402071ae0f79c7c65c5"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5174.0.0-darwin-arm64.tar.gz"
      sha256 "a09301863ef073019d4e3797347cb045b2a07b10d48234d520a05d37745dc03c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5174.0.0-linux-x64.tar.gz"
    sha256 "169bde2f5c00a60233c0c4b8ec5fcc79339f221e5cf7f5eb799292b835db2909"
  end
  version "5174.0.0"
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
