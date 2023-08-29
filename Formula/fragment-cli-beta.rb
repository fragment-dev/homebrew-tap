require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3435.0.0-darwin-x64.tar.gz"
    sha256 "0cc5c8d0f25c78a598e95bc12e316bcf867acd5b1b004bbabc51a390969381c4"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3435.0.0-darwin-arm64.tar.gz"
      sha256 "ab30579a05efcb0f9c1722c0e466a27820ef7d30f48dedaa736a0c8fcbf90571"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3435.0.0-linux-x64.tar.gz"
    sha256 "e3e54a9359dc5220813e812c6d43c1d1e1ab69752478e13940917d2302bd421f"
  end
  version "3435.0.0"
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
