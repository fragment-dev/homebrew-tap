require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4540.0.0-darwin-x64.tar.gz"
    sha256 "0f99744c00bbe4c180db5e125b032521b912e9ea70bc1edc898c70277f4e6a41"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4540.0.0-darwin-arm64.tar.gz"
      sha256 "1778974ed2bae3d1341423d8521b02147dd9f04c3c0ffb57685f00eb66cd0412"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4540.0.0-linux-x64.tar.gz"
    sha256 "b9a6908e46f54dbc83b168600fb6327ce75976b54719946562d0cef133d56807"
  end
  version "4540.0.0"
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
