require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3920.0.0-darwin-x64.tar.gz"
    sha256 "129f92fc7e96fac182b3a3a0ffdcb34bbcc99b09dde515f49d6040078de54bbf"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3920.0.0-darwin-arm64.tar.gz"
      sha256 "70619c10ef9a23ca838cddeda80d7539d07eb3d81a4187e0f57779c0f850943b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3920.0.0-linux-x64.tar.gz"
    sha256 "676ea11177dd31fd9ebd01544411202d125037180ec27f1fa1ac800df70f34d6"
  end
  version "3920.0.0"
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
