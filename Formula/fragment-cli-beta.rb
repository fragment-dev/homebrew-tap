require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4431.0.0-darwin-x64.tar.gz"
    sha256 "f40140dfc03a325faebb4ccece3d4298adb38f1e1af266b8792604eea8c9a02b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4431.0.0-darwin-arm64.tar.gz"
      sha256 "19eea57d3eafe5968355e88c52d02cccad5462a7272c99683778458d7573a273"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4431.0.0-linux-x64.tar.gz"
    sha256 "70d879b28ca6328534b12698399d37cc322a9c745359a73c22406b6358aa4254"
  end
  version "4431.0.0"
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
