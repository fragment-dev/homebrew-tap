require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3376.0.0-darwin-x64.tar.gz"
    sha256 "b7d35f72682f99732443bf952f36cdff5db6c747037ffc7ddc6bd5feaffd32b4"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3376.0.0-darwin-arm64.tar.gz"
      sha256 "86de1c9c0c72451382b4773ab43bbb47f458adba368292b6da21b6a1500091bb"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3376.0.0-linux-x64.tar.gz"
    sha256 "7783df2261ac9418b28349dc714f715a2f7170ac80a62e9e346408ebd0be6e28"
  end
  version "3376.0.0"
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
