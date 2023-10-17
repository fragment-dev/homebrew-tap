require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3850.0.0-darwin-x64.tar.gz"
    sha256 "c8fa4339b9678aac7bc309130d6c5b6d7bdb47f6887c8893568e444ab2216d33"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3850.0.0-darwin-arm64.tar.gz"
      sha256 "33a3f9204e084b3495b30cbca7c9ba37d0b12a0f1fbfaec70b3428f35da7e6b6"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3850.0.0-linux-x64.tar.gz"
    sha256 "3e231e00266bc534c0f7690fe16e4340a15fcc9cc26b16961ca36c04c4a1ce9c"
  end
  version "3850.0.0"
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
